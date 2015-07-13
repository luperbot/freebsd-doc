===================
8.7.?Image Scanners
===================

.. raw:: html

   <div class="navheader">

8.7.?Image Scanners
`Prev <mythtv.html>`__?
Chapter?8.?Multimedia
?\ `Next <kernelconfig.html>`__

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

8.7.?Image Scanners
-------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD, access to image scanners is provided by SANE (Scanner Access
Now Easy), which is available in the FreeBSD Ports Collection. SANE will
also use some FreeBSD device drivers to provide access to the scanner
hardware.

FreeBSD supports both SCSI and USB scanners. Depending upon the scanner
interface, different device drivers are required. Be sure the scanner is
supported by SANE prior to performing any configuration. Refer to
http://www.sane-project.org/sane-supported-devices.html for more
information about supported scanners.

This chapter describes how to determine if the scanner has been detected
by FreeBSD. It then provides an overview of how to configure and use
SANE on a FreeBSD system.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.7.1.?Checking the Scanner
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``GENERIC`` kernel includes the device drivers needed to support USB
scanners. Users with a custom kernel should ensure that the following
lines are present in the custom kernel configuration file:

.. code:: programlisting

    device usb
    device uhci
    device ohci
    device ehci

To determine if the USB scanner is detected, plug it in and use
``dmesg`` to determine whether the scanner appears in the system message
buffer. If it does, it should display a message similar to this:

.. code:: screen

    ugen0.2: <EPSON> at usbus0

In this example, an EPSON Perfection??1650 USB scanner was detected on
``/dev/ugen0.2``.

If the scanner uses a SCSI interface, it is important to know which SCSI
controller board it will use. Depending upon the SCSI chipset, a custom
kernel configuration file may be needed. The ``GENERIC`` kernel supports
the most common SCSI controllers. Refer to ``/usr/src/sys/conf/NOTES``
to determine the correct line to add to a custom kernel configuration
file. In addition to the SCSI adapter driver, the following lines are
needed in a custom kernel configuration file:

.. code:: programlisting

    device scbus
    device pass

Verify that the device is displayed in the system message buffer:

.. code:: screen

    pass2 at aic0 bus 0 target 2 lun 0
    pass2: <AGFA SNAPSCAN 600 1.10> Fixed Scanner SCSI-2 device
    pass2: 3.300MB/s transfers

If the scanner was not powered-on at system boot, it is still possible
to manually force detection by performing a SCSI bus scan with
``camcontrol``:

.. code:: screen

    # camcontrol rescan all
    Re-scan of bus 0 was successful
    Re-scan of bus 1 was successful
    Re-scan of bus 2 was successful
    Re-scan of bus 3 was successful

The scanner should now appear in the SCSI devices list:

.. code:: screen

    # camcontrol devlist
    <IBM DDRS-34560 S97B>              at scbus0 target 5 lun 0 (pass0,da0)
    <IBM DDRS-34560 S97B>              at scbus0 target 6 lun 0 (pass1,da1)
    <AGFA SNAPSCAN 600 1.10>           at scbus1 target 2 lun 0 (pass3)
    <PHILIPS CDD3610 CD-R/RW 1.00>     at scbus2 target 0 lun 0 (pass2,cd0)

Refer to
`scsi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=scsi&sektion=4>`__
and
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8>`__
for more details about SCSI devices on FreeBSD.

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

8.7.2.?SANE Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The SANE system is split in two parts: the backends
(`graphics/sane-backends <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sane-backends/pkg-descr>`__)
and the frontends
(`graphics/sane-frontends <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sane-frontends/pkg-descr>`__
or
`graphics/xsane <http://www.freebsd.org/cgi/url.cgi?ports/graphics/xsane/pkg-descr>`__).
The backends provide access to the scanner. Refer to
http://www.sane-project.org/sane-supported-devices.html to determine
which backend supports the scanner. The frontends provide the graphical
scanning interface.
`graphics/sane-frontends <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sane-frontends/pkg-descr>`__
installs xscanimage while
`graphics/xsane <http://www.freebsd.org/cgi/url.cgi?ports/graphics/xsane/pkg-descr>`__
installs xsane.

After installing the
`graphics/sane-backends <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sane-backends/pkg-descr>`__
port or package, use ``sane-find-scanner`` to check the scanner
detection by the SANE system:

.. code:: screen

    # sane-find-scanner -q
    found SCSI scanner "AGFA SNAPSCAN 600 1.10" at /dev/pass3

The output should show the interface type of the scanner and the device
node used to attach the scanner to the system. The vendor and the
product model may or may not appear.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Some USB scanners require firmware to be loaded. Refer to
sane-find-scanner(1) and sane(7) for details.

.. raw:: html

   </div>

Next, check if the scanner will be identified by a scanning frontend.
The SANE backends include ``scanimage`` which can be used to list the
devices and perform an image acquisition. Use ``-L`` to list the scanner
devices. The first example is for a SCSI scanner and the second is for a
USB scanner:

.. code:: screen

    # scanimage -L
    device `snapscan:/dev/pass3' is a AGFA SNAPSCAN 600 flatbed scanner
    # scanimage -L
    device 'epson2:libusb:/dev/usb:/dev/ugen0.2' is a Epson GT-8200 flatbed scanner

In this second example, ``'epson2:libusb:/dev/usb:/dev/ugen0.2'`` is the
backend name (``epson2``) and ``/dev/ugen0.2`` is the device node used
by the scanner.

If ``scanimage`` is unable to identify the scanner, this message will
appear:

.. code:: screen

    # scanimage -L

    No scanners were identified. If you were expecting something different,
    check that the scanner is plugged in, turned on and detected by the
    sane-find-scanner tool (if appropriate). Please read the documentation
    which came with this software (README, FAQ, manpages).

If this happens, edit the backend configuration file in
``/usr/local/etc/sane.d/`` and define the scanner device used. For
example, if the undetected scanner model is an EPSON Perfection??1650
and it uses the ``epson2`` backend, edit
``/usr/local/etc/sane.d/epson2.conf``. When editing, add a line
specifying the interface and the device node used. In this case, add the
following line:

.. code:: programlisting

    usb /dev/ugen0.2

Save the edits and verify that the scanner is identified with the right
backend name and the device node:

.. code:: screen

    # scanimage -L
    device 'epson2:libusb:/dev/usb:/dev/ugen0.2' is a Epson GT-8200 flatbed scanner

Once ``scanimage -L`` sees the scanner, the configuration is complete
and the scanner is now ready to use.

While ``scanimage`` can be used to perform an image acquisition from the
command line, it is often preferable to use a graphical interface to
perform image scanning. The
`graphics/sane-frontends <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sane-frontends/pkg-descr>`__
package or port installs a simple but efficient graphical interface,
xscanimage.

Alternately, xsane, which is installed with the
`graphics/xsane <http://www.freebsd.org/cgi/url.cgi?ports/graphics/xsane/pkg-descr>`__
package or port, is another popular graphical scanning frontend. It
offers advanced features such as various scanning modes, color
correction, and batch scans. Both of these applications are usable as a
GIMP plugin.

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

8.7.3.?Scanner Permissions
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In order to have access to the scanner, a user needs read and write
permissions to the device node used by the scanner. In the previous
example, the USB scanner uses the device node ``/dev/ugen0.2`` which is
really a symlink to the real device node ``/dev/usb/0.2.0``. The symlink
and the device node are owned, respectively, by the ``wheel`` and
``operator`` groups. While adding the user to these groups will allow
access to the scanner, it is considered insecure to add a user to
``wheel``. A better solution is to create a group and make the scanner
device accessible to members of this group.

This example creates a group called ``usb``:

.. code:: screen

    # pw groupadd usb

Then, make the ``/dev/ugen0.2`` symlink and the ``/dev/usb/0.2.0``
device node accessible to the ``usb`` group with write permissions of
``0660`` or ``0664`` by adding the following lines to
``/etc/devfs.rules``:

.. code:: programlisting

    [system=5]
    add path ugen0.2 mode 0660 group usb
    add path usb/0.2.0 mode 0666 group usb

Finally, add the users to ``usb`` in order to allow access to the
scanner:

.. code:: screen

    # pw groupmod usb -m joe

For more details refer to
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+----------------------------+----------------------------------------------+
| `Prev <mythtv.html>`__?   | `Up <multimedia.html>`__   | ?\ `Next <kernelconfig.html>`__              |
+---------------------------+----------------------------+----------------------------------------------+
| 8.6.?MythTV?              | `Home <index.html>`__      | ?Chapter?9.?Configuring the FreeBSD Kernel   |
+---------------------------+----------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
