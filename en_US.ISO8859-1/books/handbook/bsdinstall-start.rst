==============================
2.4.?Starting the Installation
==============================

.. raw:: html

   <div class="navheader">

2.4.?Starting the Installation
`Prev <bsdinstall-pre.html>`__?
Chapter?2.?Installing FreeBSD?9.\ *``X``* and Later
?\ `Next <using-bsdinstall.html>`__

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

2.4.?Starting the Installation
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

By default, the installation will not make any changes to the disk(s)
before the following message:

.. code:: programlisting

    Your changes will now be written to disk.  If you
    have chosen to overwrite existing data, it will
    be PERMANENTLY ERASED. Are you sure you want to
    commit your changes?

The install can be exited at any time prior to this warning. If there is
a concern that something is incorrectly configured, just turn the
computer off before this point and no changes will be made to the
system's disks.

.. raw:: html

   </div>

This section describes how to boot the system from the installation
media which was prepared using the instructions in `Section?2.3.1,
“Prepare the Installation
Media” <bsdinstall-pre.html#bsdinstall-installation-media>`__. When
using a bootable USB stick, plug in the USB stick before turning on the
computer. When booting from CD or DVD, turn on the computer and insert
the media at the first opportunity. How to configure the system to boot
from the inserted media depends upon the architecture.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.4.1.?Booting on i386™ and amd64
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

These architectures provide a BIOS menu for selecting the boot device.
Depending upon the installation media being used, select the CD/DVD or
USB device as the first boot device. Most systems also provide a key for
selecting the boot device during startup without having to enter the
BIOS. Typically, the key is either **F10**, **F11**, **F12**, or
**Escape**.

If the computer loads the existing operating system instead of the
FreeBSD installer, then either:

.. raw:: html

   <div class="orderedlist">

#. The installation media was not inserted early enough in the boot
   process. Leave the media inserted and try restarting the computer.

#. The BIOS changes were incorrect or not saved. Double-check that the
   right boot device is selected as the first boot device.

#. This system is too old to support booting from the chosen media. In
   this case, the Plop Boot Manager
   (http://www.plop.at/en/bootmanagers.html) can be used to boot the
   system from the selected media.

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

2.4.2.?Booting on PowerPC?
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

On most machines, holding **C** on the keyboard during boot will boot
from the CD. Otherwise, hold **Command**+**Option**+**O**+**F**, or
**Windows**+**Alt**+**O**+**F** on non-Apple? keyboards. At the ``0 >``
prompt, enter

.. code:: screen

    boot cd:,\ppc\loader cd:0

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

2.4.3.?Booting on SPARC64?
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Most SPARC64? systems are set up to boot automatically from disk. To
install FreeBSD from a CD requires a break into the PROM.

To do this, reboot the system and wait until the boot message appears.
The message depends on the model, but should look something like this:

.. code:: screen

    Sun Blade 100 (UltraSPARC-IIe), Keyboard Present
    Copyright 1998-2001 Sun Microsystems, Inc.  All rights reserved.
    OpenBoot 4.2, 128 MB memory installed, Serial #51090132.
    Ethernet address 0:3:ba:b:92:d4, Host ID: 830b92d4.

If the system proceeds to boot from disk at this point, press
**L1**+**A** or **Stop**+**A** on the keyboard, or send a ``BREAK`` over
the serial console. When using tip or cu, ``~#`` will issue a BREAK. The
PROM prompt will be ``ok`` on systems with one CPU and ``ok {0} `` on
SMP systems, where the digit indicates the number of the active CPU.

At this point, place the CD into the drive and type ``boot cdrom`` from
the PROM prompt.

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

2.4.4.?FreeBSD Boot Menu
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once the system boots from the installation media, a menu similar to the
following will be displayed:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.1.?FreeBSD Boot Loader Menu

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|FreeBSD Boot Loader Menu|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By default, the menu will wait ten seconds for user input before booting
into the FreeBSD installer or, if FreeBSD is already installed, before
booting into FreeBSD. To pause the boot timer in order to review the
selections, press **Space**. To select an option, press its highlighted
number, character, or key. The following options are available.

.. raw:: html

   <div class="itemizedlist">

-  ``Boot Multi User``: This will continue the FreeBSD boot process. If
   the boot timer has been paused, press **1**, upper- or lower-case
   **B**, or **Enter**.

-  ``Boot Single User``: This mode can be used to fix an existing
   FreeBSD installation as described in `Section?13.2.4.1, “Single-User
   Mode” <boot-introduction.html#boot-singleuser>`__. Press **2** or the
   upper- or lower-case **S** to enter this mode.

-  ``Escape to loader prompt``: This will boot the system into a repair
   prompt that contains a limited number of low-level commands. This
   prompt is described in `Section?13.2.3, “Stage
   Three” <boot-introduction.html#boot-loader>`__. Press **3** or
   **Esc** to boot into this prompt.

-  ``Reboot``: Reboots the system.

-  ``Configure Boot Options``: Opens the menu shown in, and described
   under, `Figure?2.2, “FreeBSD Boot Options
   Menu” <bsdinstall-start.html#bsdinstall-boot-options-menu>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.2.?FreeBSD Boot Options Menu

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|FreeBSD Boot Options Menu|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The boot options menu is divided into two sections. The first section
can be used to either return to the main boot menu or to reset any
toggled options back to their defaults.

The next section is used to toggle the available options to ``On`` or
``Off`` by pressing the option's highlighted number or character. The
system will always boot using the settings for these options until they
are modified. Several options can be toggled using this menu:

.. raw:: html

   <div class="itemizedlist">

-  ``ACPI Support``: If the system hangs during boot, try toggling this
   option to ``Off``.

-  ``Safe Mode``: If the system still hangs during boot even with
   ``ACPI           Support`` set to ``Off``, try setting this option to
   ``On``.

-  ``Single User``: Toggle this option to ``On`` to fix an existing
   FreeBSD installation as described in `Section?13.2.4.1, “Single-User
   Mode” <boot-introduction.html#boot-singleuser>`__. Once the problem
   is fixed, set it back to ``Off``.

-  ``Verbose``: Toggle this option to ``On`` to see more detailed
   messages during the boot process. This can be useful when
   troubleshooting a piece of hardware.

.. raw:: html

   </div>

After making the needed selections, press **1** or **Backspace** to
return to the main boot menu, then press **Enter** to continue booting
into FreeBSD. A series of boot messages will appear as FreeBSD carries
out its hardware device probes and loads the installation program. Once
the boot is complete, the welcome menu shown in `Figure?2.3, “Welcome
Menu” <bsdinstall-start.html#bsdinstall-choose-mode>`__ will be
displayed.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.3.?Welcome Menu

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Welcome Menu|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Press **Enter** to select the default of [?Install?] to enter the
installer. The rest of this chapter describes how to use this installer.
Otherwise, use the right or left arrows or the colorized letter to
select the desired menu item. The [?Shell?] can be used to access a
FreeBSD shell in order to use command line utilities to prepare the
disks before installation. The [?Live CD?] option can be used to try out
FreeBSD before installing it. The live version is described in
`Section?2.10, “Using the Live CD” <using-live-cd.html>`__.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

To review the boot messages, including the hardware device probe, press
the upper- or lower-case **S** and then **Enter** to access a shell. At
the shell prompt, type ``more         /var/run/dmesg.boot`` and use the
space bar to scroll through the messages. When finished, type ``exit``
to return to the welcome menu.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+----------------------------+---------------------------------------+
| `Prev <bsdinstall-pre.html>`__?   | `Up <bsdinstall.html>`__   | ?\ `Next <using-bsdinstall.html>`__   |
+-----------------------------------+----------------------------+---------------------------------------+
| 2.3.?Pre-Installation Tasks?      | `Home <index.html>`__      | ?2.5.?Using bsdinstall                |
+-----------------------------------+----------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |FreeBSD Boot Loader Menu| image:: bsdinstall/bsdinstall-newboot-loader-menu.png
.. |FreeBSD Boot Options Menu| image:: bsdinstall/bsdinstall-boot-options-menu.png
.. |Welcome Menu| image:: bsdinstall/bsdinstall-choose-mode.png
