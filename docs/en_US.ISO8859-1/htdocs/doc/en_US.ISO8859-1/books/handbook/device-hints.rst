==================
13.4.?Device Hints
==================

.. raw:: html

   <div class="navheader">

13.4.?Device Hints
`Prev <boot-splash.html>`__?
Chapter?13.?The FreeBSD Booting Process
?\ `Next <boot-shutdown.html>`__

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

13.4.?Device Hints
------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

During initial system startup, the boot
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
reads
`device.hints(5) <http://www.FreeBSD.org/cgi/man.cgi?query=device.hints&sektion=5>`__.
This file stores kernel boot information known as variables, sometimes
referred to as “device hints”. These “device hints” are used by device
drivers for device configuration.

Device hints may also be specified at the Stage 3 boot loader prompt, as
demonstrated in `Section?13.2.3, “Stage
Three” <boot-introduction.html#boot-loader>`__. Variables can be added
using ``set``, removed with ``unset``, and viewed ``show``. Variables
set in ``/boot/device.hints`` can also be overridden. Device hints
entered at the boot loader are not permanent and will not be applied on
the next reboot.

Once the system is booted,
`kenv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kenv&sektion=1>`__
can be used to dump all of the variables.

The syntax for ``/boot/device.hints`` is one variable per line, using
the hash “#” as comment markers. Lines are constructed as follows:

.. code:: screen

    hint.driver.unit.keyword="value"

The syntax for the Stage 3 boot loader is:

.. code:: screen

    set hint.driver.unit.keyword=value

where ``driver`` is the device driver name, ``unit`` is the device
driver unit number, and ``keyword`` is the hint keyword. The keyword may
consist of the following options:

.. raw:: html

   <div class="itemizedlist">

-  ``at``: specifies the bus which the device is attached to.

-  ``port``: specifies the start address of the I/O to be used.

-  ``irq``: specifies the interrupt request number to be used.

-  ``drq``: specifies the DMA channel number.

-  ``maddr``: specifies the physical memory address occupied by the
   device.

-  ``flags``: sets various flag bits for the device.

-  ``disabled``: if set to ``1`` the device is disabled.

.. raw:: html

   </div>

Since device drivers may accept or require more hints not listed here,
viewing a driver's manual page is recommended. For more information,
refer to
`device.hints(5) <http://www.FreeBSD.org/cgi/man.cgi?query=device.hints&sektion=5>`__,
`kenv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kenv&sektion=1>`__,
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__,
and
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+-------------------------+------------------------------------+
| `Prev <boot-splash.html>`__?                  | `Up <boot.html>`__      | ?\ `Next <boot-shutdown.html>`__   |
+-----------------------------------------------+-------------------------+------------------------------------+
| 13.3.?Configuring Boot Time Splash Screens?   | `Home <index.html>`__   | ?13.5.?Shutdown Sequence           |
+-----------------------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
