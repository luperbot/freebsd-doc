=======================
6.5.?Xorg Configuration
=======================

.. raw:: html

   <div class="navheader">

6.5.?Xorg Configuration
`Prev <x-config-quick-start.html>`__?
Chapter?6.?The X Window System
?\ `Next <x-fonts.html>`__

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

6.5.?Xorg Configuration
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Those with older or unusual equipment may find it helpful to gather some
hardware information before beginning configuration.

.. raw:: html

   <div class="itemizedlist">

-  Monitor sync frequencies

-  Video card chipset

-  Video card memory

.. raw:: html

   </div>

Screen resolution and refresh rate are determined by the monitor's
horizontal and vertical sync frequencies. Almost all monitors support
electronic autodetection of these values. A few monitors do not provide
these values, and the specifications must be determined from the printed
manual or manufacturer web site.

The video card chipset is also autodetected, and used to select the
proper video driver. It is beneficial for the user to be aware of which
chipset is installed for when autodetection does not provide the desired
result.

Video card memory determines the maximum resolution and color depth
which can be displayed.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.5.1.?Caveats
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ability to configure optimal resolution is dependent upon the video
hardware and the support provided by its driver. At this time, driver
support includes:

.. raw:: html

   <div class="itemizedlist">

-  Intel: as of FreeBSD?9.3 and FreeBSD?10.1, 3D acceleration on most
   Intel graphics, including IronLake, SandyBridge, and IvyBridge, is
   supported. Support for switching between X and virtual consoles is
   provided by
   `vt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vt&sektion=4>`__.

-  ATI/Radeon: 2D and 3D acceleration is supported on most Radeon cards
   up to the HD6000 series.

-  NVIDIA: several NVIDIA drivers are available in the ``x11`` category
   of the Ports Collection. Install the driver that matches the video
   card.

-  Optimus: currently there is no switching support between the two
   graphics adapters provided by Optimus. Optimus implementations vary,
   and FreeBSD will not be able to drive all versions of the hardware.
   Some computers provide a BIOS option to disable one of the graphics
   adapters or select a *discrete* mode.

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

6.5.2.?Configuring Xorg
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By default, Xorg uses HAL to autodetect keyboards and mice. The
`sysutils/hal <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/hal/pkg-descr>`__
and
`devel/dbus <http://www.freebsd.org/cgi/url.cgi?ports/devel/dbus/pkg-descr>`__
ports are automatically installed as dependencies of
`x11/xorg <http://www.freebsd.org/cgi/url.cgi?ports/x11/xorg/pkg-descr>`__,
but must be enabled by adding these entries to ``/etc/rc.conf``:

.. code:: programlisting

    hald_enable="YES"
    dbus_enable="YES"

Start these services before configuring Xorg:

.. code:: screen

    # service hald start
    # service dbus start

Once the services have been started, check whether Xorg auto-configures
itself by typing:

.. code:: screen

    # Xorg -configure

This will generate a file named ``/root/xorg.conf.new`` which attempts
to load the proper drivers for the detected hardware. Next, test that
the automatically generated configuration file works with the graphics
hardware by typing:

.. code:: screen

    # Xorg -config xorg.conf.new -retro

If a black and grey grid and an X mouse cursor appear, the configuration
was successful. To exit the test, switch to the virtual console used to
start it by pressing **Ctrl**+**Alt**+**F\ *``n``*** (**F1** for the
first virtual console) and press **Ctrl**+**C**.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The **Ctrl**+**Alt**+**Backspace** key combination may also be used to
break out of Xorg. To enable it, you can either type the following
command from any X terminal emulator:

.. code:: screen

    % setxkbmap -option terminate:ctrl_alt_bksp

or create a keyboard configuration file for hald called
``x11-input.fdi`` and saved in the ``/usr/local/etc/hal/fdi/policy``
directory. This file should contain the following lines:

.. code:: programlisting

    <?xml version="1.0" encoding="iso-8859-1"?>
    <deviceinfo version="0.2">
      <device>
        <match key="info.capabilities" contains="input.keyboard">
          <merge key="input.x11_options.XkbOptions" type="string">terminate:ctrl_alt_bksp</merge>
        </match>
      </device>
    </deviceinfo>

You will have to reboot your machine to force hald to read this file.

The following line will also have to be added to ``xorg.conf.new``, in
the ``ServerLayout`` or ``ServerFlags`` section:

.. code:: programlisting

    Option  "DontZap"   "off"

.. raw:: html

   </div>

If the test is unsuccessful, skip ahead to `Section?6.10,
“Troubleshooting” <x11-understanding.html>`__. Once the test is
successful, copy the configuration file to ``/etc/X11/xorg.conf``:

.. code:: screen

    # cp xorg.conf.new /etc/X11/xorg.conf

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Desktop environments like GNOME, KDE or Xfce provide graphical tools to
set parameters such as video resolution. If the default configuration
works, skip to `Section?6.8, “Desktop Environments” <x11-wm.html>`__ for
examples on how to install a desktop environment.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+------------------------------+
| `Prev <x-config-quick-start.html>`__?   | `Up <x11.html>`__       | ?\ `Next <x-fonts.html>`__   |
+-----------------------------------------+-------------------------+------------------------------+
| 6.4.?Quick Start?                       | `Home <index.html>`__   | ?6.6.?Using Fonts in Xorg    |
+-----------------------------------------+-------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
