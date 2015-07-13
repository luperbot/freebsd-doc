================
6.4.?Quick Start
================

.. raw:: html

   <div class="navheader">

6.4.?Quick Start
`Prev <x-install.html>`__?
Chapter?6.?The X Window System
?\ `Next <x-config.html>`__

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

6.4.?Quick Start
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In most cases, Xorg is self-configuring. When started without any
configuration file, the video card and input devices are automatically
detected and used. Autoconfiguration is the preferred method, and should
be tried first.

.. raw:: html

   <div class="procedure">

#. Check if HAL is used by the X server:

   .. code:: screen

       % pkg info xorg-server | grep HAL

   If the output shows HAL is ``off``, skip to the next step. If HAL is
   ``on``, enable needed services by adding two entries to
   ``/etc/rc.conf``. Then start the services:

   .. code:: programlisting

       hald_enable="YES"
       dbus_enable="YES"

   .. code:: screen

       # service hald start ; service dbus start

#. Rename or delete old versions of ``xorg.conf``:

   .. code:: screen

       # mv /etc/X11/xorg.conf ~/xorg.conf.etc
       # mv /usr/local/etc/X11/xorg.conf ~/xorg.conf.localetc

#. Start the X system:

   .. code:: screen

       % startx

   Test the system by moving the mouse and typing text into the windows.
   If both mouse and keyboard work as expected, see `Section?6.8,
   “Desktop Environments” <x11-wm.html>`__ and `Section?6.7, “The X
   Display Manager” <x-xdm.html>`__.

   If the mouse or keyboard do not work, continue with `Section?6.5,
   “Xorg Configuration” <x-config.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+-------------------------------+
| `Prev <x-install.html>`__?   | `Up <x11.html>`__       | ?\ `Next <x-config.html>`__   |
+------------------------------+-------------------------+-------------------------------+
| 6.3.?Installing Xorg?        | `Home <index.html>`__   | ?6.5.?Xorg Configuration      |
+------------------------------+-------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
