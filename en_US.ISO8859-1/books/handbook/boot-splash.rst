==========================================
13.3.?Configuring Boot Time Splash Screens
==========================================

.. raw:: html

   <div class="navheader">

13.3.?Configuring Boot Time Splash Screens
`Prev <boot-introduction.html>`__?
Chapter?13.?The FreeBSD Booting Process
?\ `Next <device-hints.html>`__

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

13.3.?Configuring Boot Time Splash Screens
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Joseph J. Barbish.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Typically when a FreeBSD system boots, it displays its progress as a
series of messages at the console. A boot splash screen creates an
alternate boot screen that hides all of the boot probe and service
startup messages. A few boot loader messages, including the boot options
menu and a timed wait countdown prompt, are displayed at boot time, even
when the splash screen is enabled. The display of the splash screen can
be turned off by hitting any key on the keyboard during the boot
process.

There are two basic environments available in FreeBSD. The first is the
default legacy virtual console command line environment. After the
system finishes booting, a console login prompt is presented. The second
environment is a configured graphical environment. Refer to `Chapter?6,
*The X Window System* <x11.html>`__ for more information on how to
install and configure a graphical display manager and a graphical login
manager.

Once the system has booted, the splash screen defaults to being a screen
saver. After a time period of non-use, the splash screen will display
and will cycle through steps of changing intensity of the image, from
bright to very dark and over again. The configuration of the splash
screen saver can be overridden by adding a ``saver=`` line to
``/etc/rc.conf``. Several built-in screen savers are available and
described in
`splash(4) <http://www.FreeBSD.org/cgi/man.cgi?query=splash&sektion=4>`__.
The ``saver=`` option only applies to virtual consoles and has no effect
on graphical display managers.

Sample splash screen files can be downloaded from the gallery at
`http://artwork.freebsdgr.org <http://artwork.freebsdgr.org/node/3/>`__.
By installing the
`sysutils/bsd-splash-changer <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/bsd-splash-changer/pkg-descr>`__
package or port, a random splash image from a collection will display at
boot.

The splash screen function supports 256-colors in the bitmap (``.bmp``),
ZSoft PCX (``.pcx``), or TheDraw (``.bin``) formats. The ``.bmp``,
``.pcx``, or ``.bin`` image has to be placed on the root partition, for
example in ``/boot``. The splash image files must have a resolution of
320 by 200 pixels or less in order to work on standard VGA adapters. For
the default boot display resolution of 256-colors and 320 by 200 pixels
or less, add the following lines to ``/boot/loader.conf``. Replace
*``splash.bmp``* with the name of the bitmap file to use:

.. code:: programlisting

    splash_bmp_load="YES"
    bitmap_load="YES"
    bitmap_name="/boot/splash.bmp"

To use a PCX file instead of a bitmap file:

.. code:: programlisting

    splash_pcx_load="YES"
    bitmap_load="YES"
    bitmap_name="/boot/splash.pcx"

To instead use ASCII art in the https://en.wikipedia.org/wiki/TheDraw
format:

.. code:: programlisting

    splash_txt="YES"
    bitmap_load="YES"
    bitmap_name="/boot/splash.bin"

To use larger images that fill the whole display screen, up to the
maximum resolution of 1024 by 768 pixels, the VESA module must also be
loaded during system boot. If using a custom kernel, ensure that the
custom kernel configuration file includes the ``VESA`` kernel
configuration option. To load the VESA module for the splash screen, add
this line to ``/boot/loader.conf`` before the three lines mentioned in
the above examples:

.. code:: programlisting

    vesa_load="YES"

Other interesting ``loader.conf`` options include:

.. raw:: html

   <div class="variablelist">

``beastie_disable="YES"``
    This will stop the boot options menu from being displayed, but the
    timed wait count down prompt will still be present. Even with the
    display of the boot options menu disabled, entering an option
    selection at the timed wait count down prompt will enact the
    corresponding boot option.

``loader_logo="beastie"``
    This will replace the default words “FreeBSD”, which are displayed
    to the right of the boot options menu, with the colored beastie
    logo.

.. raw:: html

   </div>

For more information, refer to
`splash(4) <http://www.FreeBSD.org/cgi/man.cgi?query=splash&sektion=4>`__,
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__,
and `vga(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vga&sektion=4>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+-----------------------------------+
| `Prev <boot-introduction.html>`__?   | `Up <boot.html>`__      | ?\ `Next <device-hints.html>`__   |
+--------------------------------------+-------------------------+-----------------------------------+
| 13.2.?FreeBSD Boot Process?          | `Home <index.html>`__   | ?13.4.?Device Hints               |
+--------------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
